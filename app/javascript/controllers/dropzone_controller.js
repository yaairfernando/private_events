import Dropzone from "dropzone";
import { Controller } from "stimulus";
import { DirectUpload } from "@rails/activestorage";
import {
  getMetaValue,
  toArray,
  findElement,
  removeElement,
  insertAfter
} from "helpers"

export default class extends Controller {
  static targets = ["input"]

  connect() {
    console.log("jjfjfj")
    this.dropZone = createDropZone(this);
    this.hideFileInput();
    this.bindEvents();
    Dropzone.autoDiscover = false;
  }

  hideFileInput() {
    this.inputTarget.disable = true
    this.inputTarget.style.display = "none";
  }
}