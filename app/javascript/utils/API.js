const headers = {
  'Content-Type': 'application/json',
  Accept: 'application/json',
  'X-CSRF-TOKEN': document.querySelector('[name="csrf-token"]').content,
}

export default {
  request: (url, method, body) => {
    return fetch(url, {
      method,
      headers,
      body: JSON.stringify(body),
    })
  },
}
