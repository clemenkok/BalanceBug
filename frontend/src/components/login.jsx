import React from 'react'
import { useEffect, useState } from 'react';
import axios from 'axios'

const Login = () => {

  
  const start = () => {
    axios.post(process.env.REACT_APP_START)
      .then((response) => {
        // Handle the API response data
        console.log(response.data);
      })
      .catch((error) => {
        // Handle any errors
        console.error('Error:', error);
      });
  }

  const stop = () => {
    axios.post(process.env.REACT_APP_STOP)
      .then((response) => {
        // Handle the API response data
        console.log(response.data);
      })
      .catch((error) => {
        // Handle any errors
        console.error('Error:', error);
      });
  }

  ;

  return (
    <div className="flex flex-col items-center justify-center h-screen">
      <div className="flex space-x-2 mb-5">
        <button onClick={start} className="bg-dark-purple hover:bg-gray-800 text-white font-mono py-4 px-6 rounded-full transform transition-all duration-300 scale-100 hover:scale-110">
        START
        </button>
        <button onClick={stop} className="bg-dark-purple hover:bg-gray-800 text-white font-mono py-4 px-6 rounded-full transform transition-all duration-300 scale-100 hover:scale-110">
        STOP
        </button>
      </div>
      <div className="text-center">
      <input
          type="range"
          min="0"
          max="100"
          step="1"
          className="w-full appearance-none bg-gray-300 h-3 outline-none focus:outline-none"
        />
      <div>
        {matrix.map((row, rowIndex) => (
          <div key={rowIndex} className="flex">
            {row.map((side, colIndex) => (
              <div
                key={colIndex}
                style={{
                  width: '13px',
                  height: '13px',
                  borderTop:  side[0] ? '2px solid black' : '1px solid white',
                  borderBottom: side[1] ?  '2px solid black' : '1px solid white',
                  borderLeft: side[2] ? '2px solid black' : '1px solid white',
                  borderRight: side[3] ? '2px solid black' : '1px solid white',
                  backgroundColor: side[4] ? 'Yellow' : 'WhiteSmoke',
                }}
              />
            ))}
          </div>
        ))}
      </div>
      </div>
  </div>
  )
}

export default Grid