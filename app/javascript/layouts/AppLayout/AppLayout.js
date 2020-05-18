import React from 'react'

export default function AppLayout(props) {
  return (
    <div>
      <header className="bg-white shadow-sm">
        <nav className="w-4/6 p-4 my-0 mx-auto">
          <h1 className="text-gray-800 antialiased text-2xl font-bold">Ur.ly</h1>
        </nav>
      </header>
      <main>{props.children}</main>
    </div>
  );
}