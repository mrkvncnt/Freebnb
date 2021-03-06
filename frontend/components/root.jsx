import React from 'react';
import '../../app/assets/stylesheets/_react_dates_override.css';
import { HashRouter } from 'react-router-dom';
import { Provider } from 'react-redux';
import { App } from './app';

export const Root = ({ store }) => (
  <Provider store={store}>
    <HashRouter>
      <App />
    </HashRouter>
  </Provider>
);