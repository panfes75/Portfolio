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