import React from "react";
import { useEffect, useState } from "react";
import axios from "axios";

import "../index.css";
import "../App.css";
import { NavBar } from "../components/nav-bar";

export const GridPage = () => {
  const [matrix, setMatrix] = useState([]);

  useEffect(() => {
    const fetchMatrix = async () => {
      try {
        const matrix = [];
        for (let i = 0; i < 50; i++) {
          const row = Array(50).fill([0, 0, 0, 0, 0]);
          matrix.push(row);
        } 
        const response = await axios.get(process.env.REACT_APP_MATRIX);
        console.log(response.data.tile_info);
        let updatedTileInfo = response.data.tile_info;
        let newGlobalX = response.data.tile_num[0];
        let newGlobalY = response.data.tile_num[1];

        matrix[newGlobalX][newGlobalY] = updatedTileInfo;

        // Log the updated array
        console.log("Updated Array:", matrix);
        setMatrix(matrix);
      } catch (error) {
        console.error("Error fetching matrix:", error);
      }
    };

    const pollingInterval = setInterval(fetchMatrix, 1000); // Poll every 3 seconds

    return () => {
      clearInterval(pollingInterval); // Clean up the interval on component unmount
    };
  }, []);

  const start = () => {
    axios
      .get(process.env.REACT_APP_START)
      .then((response) => {
        // Handle the API response data
        console.log(response.data);
      })
      .catch((error) => {
        // Handle any errors
        console.error("Error:", error);
      });
  };

  const stop = () => {
    axios
      .get(process.env.REACT_APP_STOP)
      .then((response) => {
        // Handle the API response data
        console.log(response.data);
      })
      .catch((error) => {
        // Handle any errors
        console.error("Error:", error);
      });
  };

  return (
    <div>
      <NavBar />
      <div className="flex flex-col items-center justify-center h-screen">
        <div className="flex space-x-2 mb-5">
          <button
            onClick={start}
            className="bg-dark-purple hover:bg-gray-800 text-white font-fira-code py-4 px-6 rounded-full transform transition-all duration-300 scale-100 hover:scale-110"
          >
            START
          </button>
          <button
            onClick={stop}
            className="bg-dark-purple hover:bg-gray-800 text-white font-fira-code py-4 px-6 rounded-full transform transition-all duration-300 scale-100 hover:scale-110"
          >
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
                      width: "13px",
                      height: "13px",
                      borderTop: side[0]
                        ? "3px solid white"
                        : "1px solid white",
                      borderBottom: side[1]
                        ? "3px solid white"
                        : "1px solid white",
                      borderLeft: side[2]
                        ? "3px solid white"
                        : "1px solid white",
                      borderRight: side[3]
                        ? "3px solid white"
                        : "1px solid white",
                      backgroundColor: side[4] ? "Red" : "Black",
                    }}
                  />
                ))}
              </div>
            ))}
          </div>
        </div>
      </div>
    </div>
  );
};
