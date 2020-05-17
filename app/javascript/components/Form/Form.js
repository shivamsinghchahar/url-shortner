import React, { useState } from 'react'

import API from '../../utils/API'

export default function Form(props) {
  const [url, setUrl] = useState('');
  const [loading, setLoading] = useState(false);

  function handleSubmit(e) {
    setLoading(true);
    e.preventDefault();
    API.request('/urls', 'POST', { url: { original_url: url } })
      .then(res => res.json())
      .then(data => {
        setLoading(false);
        window.location.reload();
      })
      .catch(err => console.error(err));
  }

  return (
    <form className="w-full flex shadow-sm" onSubmit={handleSubmit}>
      <div className="w-full">
        <input
          className="bg-white appearance-none border-2 border-white w-full py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-purple-500"
          id="inline-full-name"
          type="text"
          placeholder="Enter a Url to shorten..."
          onChange={e => setUrl(e.target.value)}
          value={url}
          required
        />
      </div>
      <div>
        <input
          className={`${loading ? 'opacity-50 cursor-not-allowed' : ''} bg-purple-500 hover:bg-purple-400 focus:shadow-outline focus:outline-none text-white font-bold py-2 px-4`}
          type="submit"
          value="Shorten!"
          disabled={loading}
        />
      </div>
    </form>
  )
}