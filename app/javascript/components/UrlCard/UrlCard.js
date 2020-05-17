import React, { useState } from 'react'

export default function UrlCard({ url }) {
  const [pinned, setPinned] = useState(false);

  return (
    <li className="bg-white mb-px">
      <article className="flex">
        <aside className="flex">
          <button
            className={`${pinned ? 'text-purple-500': 'text-gray-600'} p-4 bg-gray-100 hover:text-purple-400`}
            onClick={() => setPinned(!pinned)}
          >
            <svg width="16px" height="16px" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="thumbtack" className="svg-inline--fa fa-thumbtack fa-w-12" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512">
              <path fill="currentColor" d="M298.028 214.267L285.793 96H328c13.255 0 24-10.745 24-24V24c0-13.255-10.745-24-24-24H56C42.745 0 32 10.745 32 24v48c0 13.255 10.745 24 24 24h42.207L85.972 214.267C37.465 236.82 0 277.261 0 328c0 13.255 10.745 24 24 24h136v104.007c0 1.242.289 2.467.845 3.578l24 48c2.941 5.882 11.364 5.893 14.311 0l24-48a8.008 8.008 0 0 0 .845-3.578V352h136c13.255 0 24-10.745 24-24-.001-51.183-37.983-91.42-85.973-113.733z" />
            </svg>
          </button>
        </aside>
        <div className="flex justify-between w-full items-center">
          <a
            className="p-4 hover:underline"
            href={url.original_url}
            target="_blank"
          >
            {url.original_url}
          </a>
          <a
            className="p-4 hover:underline"
            href={window.location.href + url.slug}
            target="_blank"
          >
            {window.location.href + url.slug}
          </a>
        </div>
      </article>
    </li>
  )
}