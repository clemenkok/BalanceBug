import React from "react";
import { Auth0Feature } from "./auth0-feature";

export const Auth0Features = () => {
  const featuresList = [
    {
      title: "15 June 02:50:30",
      description:
        "Need to tune our control algorithm a bit more",
      resourceUrl: " ",
      icon: "https://cdn.auth0.com/blog/hello-auth0/identity-providers-logo.svg",
    },
    {
     
      title: "13 June 12:21:30",
      description:
        "Beacon distance finding can be made more accurate",
      resourceUrl: " ",
      icon: "https://cdn.auth0.com/blog/hello-auth0/identity-providers-logo.svg",
    },
    {
      
      title: "12 June 10:04:31",
      description:
        "Latency issues? To do some load testing",
      resourceUrl: " ",
      icon: "https://cdn.auth0.com/blog/hello-auth0/identity-providers-logo.svg",
    },
    {
      
      title: "09 June 18:23:29",
      description:
        "Slight modifications needed to path planning algorithm",
      resourceUrl: " ",
      icon: "https://cdn.auth0.com/blog/hello-auth0/identity-providers-logo.svg",
    },
  ];

  return (
    <div className="auth0-features">
      <h2 className="auth0-features__title">Recent Maps...</h2>
      <div className="auth0-features__grid">
        {featuresList.map((feature) => (
          <Auth0Feature
            key={feature.resourceUrl}
            title={feature.title}
            description={feature.description}
            resourceUrl={feature.resourceUrl}
            icon={feature.icon}
          />
        ))}
      </div>
    </div>
  );
};