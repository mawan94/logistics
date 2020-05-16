package com.example.logistics.domain;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPCell;
import com.lowagie.text.Cell;
import org.springframework.web.servlet.view.document.AbstractPdfView;

import com.lowagie.text.Document;
import com.lowagie.text.Table;
import com.lowagie.text.pdf.PdfWriter;

public class OrderPDFView extends AbstractPdfView {

    protected void buildPdfDocument(Map<String, Object> model, Document document,
                                    PdfWriter pdfWriter, HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        List<String> orderData = (List<String>) model.get("orderData");
        String[] titles = new String[]{"ORDER_ID", "SENDER", "DELIVERY_PERSON", "RECIPIENT", "RECIPIENT_PHONE", "RECIPIENT_ADDRESS", "ORDER_STATUS", "COURIER_FEE", "RATE", "REMARK"};
        Table table = new Table(10);
        for (String title : titles) {
            table.addCell(title);
            PdfPCell pdfCell = new PdfPCell();
            pdfCell.setPhrase(new Paragraph(title));

            table.addCell(new Cell());
        }

        for (String orderDatum : orderData) {
            table.addCell(orderDatum);
        }
        document.add(table);
    }
}

