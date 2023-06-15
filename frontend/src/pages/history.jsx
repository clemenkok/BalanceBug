import React from "react";
import { NavBar } from "../components/nav-bar";
import { Auth0Features } from "../components/auth0-features";

export const HistoryPage = () => {
  return (
    <div>
      <NavBar />
      <div className="flex flex-col items-center justify-center h-screen">
        <Auth0Features/>
      </div>
    </div>
  );
};
