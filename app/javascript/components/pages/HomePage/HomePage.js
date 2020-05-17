import React from 'react'

import AppLayout from '../../../layouts/AppLayout/AppLayout'
import Form from '../../Form/Form'
import UrlList from '../../UrlList/UrlList'

export default function HomePage({ urls }) {
  return (
    <AppLayout>
      <Form />
      <UrlList urls={urls} />
    </AppLayout>
  )
}