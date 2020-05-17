import React from 'react'
import UrlCard from '../UrlCard/UrlCard'

export default function UrlList({ urls }) {
  return (
    <section className="my-4 w-4/6 p-4 my-0 mx-auto">
      <div>
        <ul className="border shadow-sm">
          {
            urls.map((url) => <UrlCard url={url} key={url.id}/>)
          }
        </ul>
      </div>
    </section>
  )
}