import React from "react";
import axios from "axios";


import "../index.css";
import "../App.css";

//var myhtml =require('../html/newmapping/kmean.html');

export class NewMapping extends React.Component {
  componentDidMount() {
    const script = document.createElement("script");
    script.src = "../html/newmapping/fuckingjs/index.js";
    script.async = true;
    document.body.appendChild(script);
  }

  render() {
    return (
      <div>
        <button id="mybutton" onclick="addball()">
          Get raw data
        </button>
        <button id="mybutton2" onclick="addball()">
          Get blurred data
        </button>
      </div>
    );
  }
}
