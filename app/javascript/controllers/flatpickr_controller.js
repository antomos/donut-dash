import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = ["requestedDate"];

  connect() {
    console.log("flatpickr_controller.js");
    flatpickr(this.requestedDateTarget, {});
  }
}
