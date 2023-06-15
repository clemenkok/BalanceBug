import { useAuth0 } from "@auth0/auth0-react";
import React from "react";
import { NavBarTab } from "./nav-bar-tab";

export const NavBarTabs = () => {
  const { isAuthenticated } = useAuth0();

  return (
    <div className="nav-bar__tabs">
      {!isAuthenticated && (
        <>
        <NavBarTab path="/history" label="View History" />
        <NavBarTab path="/gridmonitoring" label="Grid Monitoring" />
        <NavBarTab path="/grid" label="Grid" />
        </>
      )}
    </div>
  );
};