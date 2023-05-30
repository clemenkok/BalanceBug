import React from 'react'
import { useState } from 'react';

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

const Grid = () => {

  const [grid, setGrid] = useState(randomMatrix
  );
  console.log(grid);
  return (
    <div class="flex items-center justify-center h-screen">
    <div class="text-center">
    <div>
      {grid.map((row, rowIndex) => (
        <div key={rowIndex} className="flex">
          {row.map((side, colIndex) => (
            <div
              key={colIndex}
              style={{
                width: '10px',
                height: '10px',
                backgroundColor: 'WhiteSmoke',
                borderTop:  side == 1 ? '2px solid black' : '1px solid white',
                borderBottom: side == 2 ?  '2px solid black' : '1px solid white',
                borderLeft: side == 3 ?'2px solid black' : '1px solid white',
                borderRight: side == 4 ? '2px solid black' : '1px solid white',
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