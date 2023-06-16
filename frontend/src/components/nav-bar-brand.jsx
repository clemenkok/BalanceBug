import React from "react";
import { NavLink } from "react-router-dom";
import myImage from "../img/istockphoto-470365028-612x612-removebg-preview.png";

export const NavBarBrand = () => {
  return (
    <div className="nav-bar__brand">
      <NavLink to="/">
        <img
          className="nav-bar__logo"
          src={ myImage }
          alt="Auth0 shield logo"
          width="36"
          height="36"
        />
      </NavLink>
    </div>
  );
};