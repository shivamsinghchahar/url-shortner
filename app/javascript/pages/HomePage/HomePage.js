import React from 'react'

import AppLayout from '../../layouts/AppLayout/AppLayout'
import Form from '../../components/Form/Form'
import UrlList from '../../components/UrlList/UrlList'

function compare(a, b) {
  if (a.pinned < b.pinned) {
    return 1
  }
  if (a.pinned > b.pinned) {
    return -1
  }
  return new Date(b.created_at) - new Date(a.created_at)
}

export default class HomePage extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      loading: false,
      urls: null,
    }
  }

  componentDidMount() {
    this.setState({ urls: this.props.urls })
  }

  setLoading = (loading) => {
    this.setState({ ...this.state, loading })
  }

  addUrls = (newUrl) => {
    let urls = [...this.state.urls];

    if (urls.find(url => url.id === newUrl.id)) {
      return
    } else {
      urls.push(newUrl)
    }

    this.setState({
      ...this.state,
      urls: urls.sort(compare),
    })
  }

  updateUrls = (updateUrl) => {
    this.setState({
      ...this.state,
      urls: this.state.urls.map((url) => {
        return url.id === updateUrl.id ? updateUrl : url
      }).sort(compare),
    })
  }

  render() {
    const { urls, loading } = this.state
    return (
      <AppLayout>
        <Form
          loading={loading}
          setLoading={this.setLoading}
          addUrls={this.addUrls}
        />
        {
          urls && (<UrlList
            urls={urls}
            setLoading={this.setLoading}
            loading={loading}
            updateUrls={this.updateUrls}
          />)
        }
      </AppLayout>
    )
  }
}