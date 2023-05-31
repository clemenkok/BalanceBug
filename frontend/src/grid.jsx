/*

TODO: (1) Implement new 3D Array grid structure that indicates information 

*/


import React from 'react'
import { useEffect, useState } from 'react';
import axios from 'axios'

/*
function generateRandomMatrix(rows, cols) {
  const matrix = [];
  
  for (let i = 0; i < rows; i++) {
    const row = [];
    for (let j = 0; j < cols; j++) {
      const randomNumber = Math.floor(Math.random() * 4) + 1;
      row.push(randomNumber);
    }
    matrix.push(row);
  }
  
  return matrix;
}

const rows = 50;
const cols = 50;
const randomMatrix = generateRandomMatrix(rows, cols);
*/



const Grid = () => {

  const [matrix, setMatrix] = useState([]);

  useEffect(() => {
    const fetchMatrix = async () => {
      try {
        const response = await axios.get('http://localhost:8000/matrix');
        const { matrix } = response.data;
        console.log(matrix);
        setMatrix(matrix);
      } catch (error) {
        console.error('Error fetching matrix:', error);
      }
    };

    const pollingInterval = setInterval(fetchMatrix, 3000); // Poll every 3 seconds

    return () => {
      clearInterval(pollingInterval); // Clean up the interval on component unmount
    };

  }, []);

  return (
    <div class="flex items-center justify-center h-screen">
    <div class="text-center">
    <div>
      {matrix.map((row, rowIndex) => (
        <div key={rowIndex} className="flex">
          {row.map((side, sideIndex) => (
              <div key={sideIndex} className="flex">
                {side.map((element, infoIndex) => (
                  <div
                    key={infoIndex}
                    style={{
                      width: '15px',
                      height: '15px',
                      backgroundColor: 'WhiteSmoke',
                      borderTop:  element == 1 ? '2px solid black' : '1px solid white',
                      borderBottom: element == 2 ?  '2px solid black' : '1px solid white',
                      borderLeft: element == 3 ?'2px solid black' : '1px solid white',
                      borderRight: element == 4 ? '2px solid black' : '1px solid white',
                    }}
                  />
                ))}
              </div>
          ))}
        </div>
      ))}
    </div>
    </div>
  </div>
  )
}

export default Grid