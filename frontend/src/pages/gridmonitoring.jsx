import React, { useEffect } from "react";
import Plotly from "plotly.js-dist";
import { NavBar } from "../components/nav-bar";

export const GridMonitoringPage = () => {
  useEffect(() => {
    const data = [
      {
        x: [1, 2, 3, 4, 5],
        y: [1, 4, 9, 16, 25],
        type: "scatter",
        marker: {
          color: "white", // Set the line color to white
        },
      },
    ];
    const layout = {
      title: "D.C. Grid Monitoring - Capacitor",
      xaxis: { title: "Time" },
      yaxis: { title: "Capacitor Reading" },
      plot_bgcolor: "black", // Set the plot background color to black
      paper_bgcolor: "black", // Set the paper background color to black
      font: {
        color: "white", // Set the font color to white
      },
    };

    Plotly.newPlot("plot", data, layout);
  }, []);

  return (
    <div>
      <NavBar />
      <div style={{ width: "80%", height: "400px", margin: "0 auto" }}>
        <div id="plot" style={{ width: "100%", height: "100%" }}></div>
      </div>
    </div>
  );
};

export default GridMonitoringPage;
