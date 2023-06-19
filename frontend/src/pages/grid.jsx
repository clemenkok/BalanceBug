import React from "react";
import axios from "axios";

import "../index.css";
import "../App.css";
import { NavBar } from "../components/nav-bar";
import { CoordinateForm } from "../components/coordinate-form";

// Add a counter and findByPK on that counter.

export class GridPage extends React.Component {
  constructor() {
    super();
    let temp = [];
    for (let i = 0; i < 48; i++) {
      const row = Array(73).fill([0, 0, 0, 0, 0]);
      temp.push(row);
    }

    //const [matrix, setMatrix] = useState(temp);
    this.state = {
      counter: 36,
    };
    this.state.matrix = temp;
  }

  handlePoll = () => {
    this.setState((prevState) => ({
      counter: prevState.counter + 0.5,
    }));
  };

  componentDidMount() {
    const fetchMatrix = async () => {
      try {
        this.handlePoll();
        console.log("counter is", this.state.counter);
        const response = await axios.get(process.env.REACT_APP_MATRIX, {
          params: {
            counter_val: this.state.counter
          },
        });
        console.log(response.data);
        let updatedTileInfo = response.data.tile_info;
        let newGlobalX = response.data.tile_num[0];
        let newGlobalY = response.data.tile_num[1];

        this.setState((prevState) => {
          const matrixCopy = [...prevState.matrix]; // Create a copy of the matrix
          matrixCopy[newGlobalX][newGlobalY] = updatedTileInfo; // Update the copy

          // Log the updated array
          console.log("Updated Array:", matrixCopy[0][0]);

          return { matrix: matrixCopy }; // Update the state with the modified copy - this works
        });

        this.forceUpdate();
      } catch (error) {
        console.error("Error fetching matrix:", error);
      }
    };
    setInterval(fetchMatrix, 3000); // Poll every 0.5 seconds
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
        <div className="min-h-screen flex">
          <div className="w-1/3 p-8">
            <CoordinateForm />
          </div>
          <div className="flex flex-col items-center justify-center h-screen">
            <div>
              <input
                type="range"
                min="0"
                max="100"
                step="1"
                className="w-full appearance-none bg-gray-300 h-3 outline-none focus:outline-none slider"
              />
              <div className="p-4">
                {this.state.matrix.map(function (row, rowIndex) {
                  return (
                    <div key={rowIndex} className="flex">
                      {row.map(function (side, colIndex) {
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
              <input
                type="range"
                min="0"
                max="100"
                step="1"
                className="w-full appearance-none bg-gray-300 h-3 outline-none focus:outline-none"
              />
            </div>
          </div>
        </div>
      </div>
    );
  }
}
