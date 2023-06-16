import React from "react";
import axios from "axios";

import "../index.css";
import "../App.css";
import { NavBar } from "../components/nav-bar";

// TODO: When start key in initial coordinates

export class GridPage extends React.Component {
  constructor() {
    super();
    let temp = [];
    for (let i = 0; i < 48; i++) {
      const row = Array(73).fill([0, 0, 0, 0, 0]);
      temp.push(row);
    }

    //const [matrix, setMatrix] = useState(temp);
    this.state = {};
    this.state.matrix = temp;
  }

  componentDidMount() {
    const fetchMatrix = async () => {
      try {
        const response = await axios.get(
          "http://localhost:8080/api/live_database/latest"
        );
        console.log(response.data);
        let updatedTileInfo = response.data.tile_info;
        let newGlobalX = response.data.tile_num[0];
        let newGlobalY = response.data.tile_num[1];

        //let copy = JSON.parse(JSON.stringify(this.state.matrix));

        this.state.matrix[newGlobalX][newGlobalY] = updatedTileInfo;

        // Log the updated array
        console.log("Updated Array:", this.state.matrix[0][0]);

        this.forceUpdate();
      } catch (error) {
        console.error("Error fetching matrix:", error);
      }
    };

    setInterval(fetchMatrix, 1000); // Poll every 3 seconds
  }

  start = () => {
    axios
      .post(process.env.REACT_APP_START)
      .then((response) => {
        // Handle the API response data
        console.log(response.data);
      })
      .catch((error) => {
        // Handle any errors
        console.error("Error:", error);
      });
  };

  stop = () => {
    axios
      .post(process.env.REACT_APP_STOP)
      .then((response) => {
        // Handle the API response data
        console.log(response.data);
      })
      .catch((error) => {
        // Handle any errors
        console.error("Error:", error);
      });
  };

  render() {
    return (
      <div>
        <NavBar />
        <div className="flex flex-col items-center justify-center h-screen">
          <div className="flex space-x-2 mb-5">
            <button
              onClick={this.start}
              className="bg-dark-purple hover:bg-gray-800 text-white font-fira-code py-4 px-6 rounded-full transform transition-all duration-300 scale-100 hover:scale-110"
            >
              START
            </button>
            <button
              onClick={this.stop}
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
              {this.state.matrix.map(function (row, rowIndex) {
                //console.log(matrix)
                return (
                  <div key={rowIndex} className="flex">
                    {row.map(function (side, colIndex) {
                      //console.log(side)
                      return (
                        <div
                          key={colIndex}
                          style={{
                            width: "10px",
                            height: "10px",
                            backgroundColor: side[0] ? "Red" : "Black",
                            borderTop: side[1]
                              ? "3px solid white"
                              : "1px solid white",
                            borderBottom: side[2]
                              ? "3px solid white"
                              : "1px solid white",
                            borderLeft: side[3]
                              ? "3px solid white"
                              : "1px solid white",
                            borderRight: side[4]
                              ? "3px solid white"
                              : "1px solid white",
                          }}
                        />
                      );
                    })}
                  </div>
                );
              })}
            </div>
          </div>
        </div>
      </div>
    );
  }
}
