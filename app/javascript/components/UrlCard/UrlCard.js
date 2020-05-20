import React from 'react'

import API from '../../utils/API'

export default class UrlCard extends React.Component {
  constructor(props) {
    super(props)
  }

  handlePin = async (url) => {
    const { updateUrls } = this.props
    try {
      let res = await API.request(`/urls/${url.slug}`, 'PUT', { url: { pinned: !url.pinned } })
      let data = await res.json()
      if (data.errors) {
        throw Error(data.errors)
      } else {
        await updateUrls(data.url)
      }
    } catch (error) {
      console.error(error)
    }
  }

  handleClick = async (url) => {
    const { updateUrls } = this.props
    try {
      let res = await API.request(`/urls/${url.slug}/decode`, 'PUT')
      let data = await res.json()
      if (data.errors) {
        throw Error(data.errors)
      } else {
        await updateUrls(data.url)
        window.location.assign(data.url.original)
      }
    } catch (error) {
      console.error(error)
    }
  }

  render() {
    const { url } = this.props
    return (
      <li className="bg-white mb-px">
        <article className="flex">
          <aside className="flex">
            <button
              className={`${url.pinned ? 'text-purple-500' : 'text-gray-600'} p-4 bg-gray-100 hover:text-purple-400`}
              onClick={() => this.handlePin(url)}
            >
              <svg width="16px" height="16px" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="thumbtack" className="svg-inline--fa fa-thumbtack fa-w-12" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512">
                <path fill="currentColor" d="M298.028 214.267L285.793 96H328c13.255 0 24-10.745 24-24V24c0-13.255-10.745-24-24-24H56C42.745 0 32 10.745 32 24v48c0 13.255 10.745 24 24 24h42.207L85.972 214.267C37.465 236.82 0 277.261 0 328c0 13.255 10.745 24 24 24h136v104.007c0 1.242.289 2.467.845 3.578l24 48c2.941 5.882 11.364 5.893 14.311 0l24-48a8.008 8.008 0 0 0 .845-3.578V352h136c13.255 0 24-10.745 24-24-.001-51.183-37.983-91.42-85.973-113.733z" />
              </svg>
            </button>
          </aside>
          <div className="flex justify-between w-full items-center">
            <a
              className="p-4 hover:underline"
              href={url.original}
              target="_blank"
            >
              {url.original}
            </a>
            <button
              onClick={() => this.handleClick(url)}
              className="p-4 hover:underline"
            >
              {window.location.href + url.slug}
            </button>
          </div>
          <aside className="flex items-center p-2">
            <span className="bg-purple-300 p-2 border border-purple-400 text-white text-xs font-bold rounded-r-lg">
              { url.clicks }
            </span>
          </aside>
        </article>
      </li>
    )
  }
}