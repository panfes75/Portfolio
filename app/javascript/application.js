// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//= require jquery
//= require jquery_ujs

import $ from 'jquery';
window.$ = $;
window.jQuery = $;

import { Turbo } from "@hotwired/turbo-rails"
Turbo.session.drive = false
import "./controllers/application";
import "./controllers/hello_controller";
import "./menu";
import "./print";

document.addEventListener('turbo:load', () => {
  document.querySelectorAll('a[data-turbo-confirm]').forEach((element) => {
    element.addEventListener('click', (event) => {
      if (!confirm(element.getAttribute('data-turbo-confirm'))) {
        event.preventDefault();
        event.stopImmediatePropagation();
      }
    });
  });
});

