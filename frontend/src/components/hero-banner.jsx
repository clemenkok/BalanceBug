import React from "react";
import myImage from "../img/istockphoto-470365028-612x612-removebg-preview.png";
import { NavLink } from "react-router-dom";

export const HeroBanner = () => {
  return (
    <div className="hero-banner hero-banner--pink-yellow">
      <div className="hero-banner__logo">
        <img className="hero-banner__image" src={myImage} alt="React logo" />
      </div>
      <h1 className="hero-banner__headline">BalanceBug</h1>
      <p className="hero-banner__description">
        Self-Navigating Maze Solver from <strong> Imperial EEE </strong>.
      </p>
      <NavLink to="/grid">
        <div className="button button--secondary">Let's Map →</div>
      </NavLink>
    </div>
  );
};
