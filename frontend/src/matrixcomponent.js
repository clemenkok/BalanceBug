import React, { useEffect, useState } from 'react';
import axios from 'axios';

const MatrixComponent = () => {
  const [matrix, setMatrix] = useState([]);

  useEffect(() => {
    const fetchMatrix = async () => {
      try {
        const response = await axios.get('http://localhost:8000/matrix');
        const { matrix } = response.data;

        setMatrix(matrix);
      } catch (error) {
        console.error('Error fetching matrix:', error);
      }
    };

    fetchMatrix();
  }, []);

  if (matrix.length === 0) {
    return <div>Loading...</div>;
  }

  return (
    <div className="matrix-container">
      {matrix.map((row, rowIndex) => (
        <div key={rowIndex} className="row">
          {row.map((value, columnIndex) => (
            <div key={columnIndex} className="cell">
              {value}
            </div>
          ))}
        </div>
      ))}
    </div>
  );
};

export default MatrixComponent;
