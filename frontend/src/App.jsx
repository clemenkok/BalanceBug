import React from "react";
import "./index.css";
import "./App.css";

import { useAuth0 } from "@auth0/auth0-react";
import { PageLoader } from "./components/page-loader";
import { CallbackPage } from "./pages/callback-page";

import { Route, Routes } from "react-router-dom";

// import { AuthenticationGuard } from "./components/authentication-guard";

import { GridPage } from "./pages/grid";
import { HistoryPage } from "./pages/history";
import { SearchPage } from "./pages/search";
import { PageNotFound } from "./pages/pagenotfound";
import { GridMonitoringPage } from "./pages/gridmonitoring";
import { HomePage } from "./pages/home-page";

function App() {
  const { isLoading } = useAuth0();

  if (isLoading) {
    return (
      <div className="page-layout">
        <PageLoader />
      </div>
    );
  }

  return (
    <Routes>
      <Route path="/" element={<HomePage />} />
      <Route path="/history" element={<HistoryPage />} />
      <Route path="/search" element={<SearchPage />} />
      <Route path="/gridmonitoring" element={<GridMonitoringPage />} />
      <Route path="/grid" element={<GridPage />} />
      <Route path="/callback" element={<CallbackPage />} />
      <Route path="*" element={<PageNotFound />} />
    </Routes>
  );
}

export default App;
