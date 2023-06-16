import React from "react";
import { NavBar } from "../components/nav-bar";

export const SearchPage = () => {
  return (
    <div>
      <NavBar />
      <div className="flex items-center justify-center h-screen bg-dark">
        <div className="bg-gray-800 rounded-lg p-4">
          <input
            type="text"
            placeholder="Search..."
            style={{ width: "300px", height: "40px", fontSize: "16px" }}
            className=" font-fira-code mr-2 bg-gray-700 text-white rounded-lg px-4 py-2 focus:outline-none focus:ring focus:border-blue-300"
          />
          <button
            type="button"
            style={{ width: "80px", height: "30px", fontSize: "12px" }}
            className=" font-fira-code bg-blue-500 hover:bg-blue-600 text-white rounded-lg px-4 py-2 mt-2"
          >
            Search
          </button>
        </div>
      </div>
    </div>
  );
};
