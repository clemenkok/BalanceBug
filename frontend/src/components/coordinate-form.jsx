import React, { useState } from "react";
import axios from "axios";
import { BsFillCheckSquareFill } from "react-icons/bs";

export const CoordinateForm = () => {
  const [x, setX] = useState("");
  const [y, setY] = useState("");

  const [success, setSuccess] = useState(false);

  const handleSubmit = (e) => {
    e.preventDefault();
    // Handle the form submission logic here
    // For example, you can pass the x and y values to a parent component or make an API call
    console.log("Submitted:", x, y);

    try {
      axios.post(process.env.REACT_APP_START, { x: x, y: y });
    } catch (error) {
      console.error("Error sending start coordinates", error);
    }
    setSuccess(true);
  };

  const handleStop = (e) => {
    e.preventDefault();
    try {
      axios.post(process.env.REACT_APP_STOP, { stop: "1" });
    } catch (error) {
      console.error("Error sending stop", error);
    }
  };

  return (
    <form onSubmit={handleSubmit} className="bg-gray-800 p-4 rounded-lg mt-80">
      <div className="mb-4">
        <label htmlFor="x" className="font-fira-code text-white">
          X Coordinate:
        </label>
        <input
          type="text"
          id="x"
          className="w-full bg-gray-700 font-fira-code text-white rounded p-2"
          value={x}
          onChange={(e) => setX(e.target.value)}
        />
      </div>
      <div className="mb-4">
        <label htmlFor="y" className="font-fira-code text-white">
          Y Coordinate:
        </label>
        <input
          type="text"
          id="y"
          className="w-full bg-gray-700 text-white rounded p-2"
          value={y}
          onChange={(e) => setY(e.target.value)}
        />
      </div>
      <button
        type="submit"
        className="bg-blue-500 hover:bg-blue-600 text-white rounded py-2 px-4"
        value="start"
      >
        Start
      </button>
      <button
        type="button"
        className="bg-red-500 hover:bg-red-600 text-white rounded py-2 px-4 ml-4"
        onClick={handleStop}
      >
        Stop
      </button>
      {success && (
        <p className="flex items-center gap-1 mb-5 font-semibold text-green-500">
          <BsFillCheckSquareFill /> Form has been submitted successfully
        </p>
      )}
    </form>
  );
};

// TODO: START and STOP Button, Hover to indicate current position
