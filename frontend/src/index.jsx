import React from "react";
import App from "./App";
import "./styles/styles.css";
import { createRoot } from "react-dom/client";
import { BrowserRouter } from "react-router-dom";

import { Auth0ProviderWithNavigate } from "./auth0-provider-with-navigate";

const container = document.getElementById("root");
const root = createRoot(container);

root.render(
  <React.StrictMode>
    <BrowserRouter>
      <Auth0ProviderWithNavigate>
      <App />
      </Auth0ProviderWithNavigate>
    </BrowserRouter>
  </React.StrictMode>
);
