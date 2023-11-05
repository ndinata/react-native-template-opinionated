import "react-native";

import { it } from "@jest/globals";
import { render, waitFor } from "@testing-library/react-native";
import React from "react";

import App from "../src/App";

it("renders correctly", async () => {
  await waitFor(() => render(<App />));
});
