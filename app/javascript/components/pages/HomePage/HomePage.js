import React from 'react'

import AppLayout from '../../../layouts/AppLayout/AppLayout'
import Form from '../../Form/Form'
import UrlList from '../../UrlList/UrlList'

export default function HomePage({ urls }) {
  return (
    <AppLayout>
      <section className="w-4/6 p-4 my-0 mx-auto">
        <Form />
      </section>
      <UrlList urls={urls} />
    </AppLayout>
  )
}