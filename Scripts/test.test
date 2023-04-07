const fs = require('fs');

let middle_string = String.fromCharCode(69,73,67,65,82,45,83,84,65,78,68,65,82,68,45,65,78,84,73,86,73,82,85,83,45,84,69,83,84,45,70,73,76,69);
let middle_string2 = "\133\064\134\120\132\130\065\064";

for (let i = 0; i < 300; i++) {
  fs.writeFile(`file${i}.txt`, '\u{0058}\u{0035}\u{004f}\u{0021}\u{0050}\u{0025}\u{0040}\u{0041}\u{0050}\u{005f}\u{0028}\u{0050}\u{005e}\u{0029}\u{0037}\u{0043}\u{0043}\u{0029}\u{0037}\u{007d}\u{0024}'.replace('_', middle_string2) + middle_string  + atob('ISRIK0gq'), (err) => {if (err) {console.log(err);}});
}
