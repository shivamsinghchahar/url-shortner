import React from 'react'
import UrlCard from '../UrlCard/UrlCard'

export default function UrlList({ urls, loading, setLoading, updateUrls }) {
  return (
    <section className="my-4 w-4/6 p-4 my-0 mx-auto">
      <div>
        <ul className="border shadow-sm">
          <li className="flex items-center justify-between bg-purple-600 mb-px p-4 text-white text-xl">
            <p className="w-2/5 flex justify-center">
              Original
            </p>
            <p className="w-2/5 flex justify-center">
              Short
            </p>
          </li>
          {
            urls.map((url) => (<UrlCard
              url={url}
              key={url.id}
              loading={loading}
              setLoading={setLoading}
              updateUrls={updateUrls}
            />))
          }
        </ul>
      </div>
    </section>
  )
}