package com.metime.service;

import java.io.File;
import java.io.FileNotFoundException;

import org.springframework.stereotype.Service;

import com.itextpdf.io.image.ImageData;
import com.itextpdf.io.image.ImageDataFactory;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.borders.Border;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.element.Image;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Table;
import com.itextpdf.layout.properties.UnitValue;

@Service
public class PDFService {

    public void pdfCreation(String id) {
        String pdfPath = "D:\\PDFs\\itinerary" + id + ".pdf";
        try {
            // Initialize PDF writer
            PdfWriter writer = new PdfWriter(pdfPath);
            
            // Initialize PDF document
            PdfDocument pdfDoc = new PdfDocument(writer);
            
            // Initialize document
            Document document = new Document(pdfDoc);
            
            // Absolute path to the image file
            String imgPath = getClass().getClassLoader().getResource("static/images/2.jpeg").getPath();
            File imgFile = new File(imgPath);
            if (imgFile.exists()) {
                ImageData imageData = ImageDataFactory.create(imgPath);
                Image image1 = new Image(imageData);
                image1.scaleAbsolute(200.0f, 200.0f);
                document.add(image1);
            } else {
                System.out.println("Image file not found: " + imgPath);
            }
            
            // Add paragraphs to the document
            document.add(new Paragraph("Welcome to MeTime"));
            document.add(new Paragraph("Here is the detailed itinerary for " + id));
            document.add(new Paragraph("Confirm booking for Trip " + id));
            
            // Create a table with 2 columns
            Table table = new Table(UnitValue.createPercentArray(2)).useAllAvailableWidth();
            
            // Add table headers
            table.addHeaderCell("User");
            table.addHeaderCell("Password");
            
            // Add table rows (example data)
            table.addCell("username1");
            table.addCell("password1");
            
            // Create cells for the second row with no borders
            Cell userCell = new Cell().setBorder(Border.NO_BORDER);
            Cell passwordCell = new Cell().setBorder(Border.NO_BORDER);
            
            // Add the borderless cells to the table
            table.addCell(userCell);
            table.addCell(passwordCell);
            
            // Add the table to the document
            document.add(table);
            
            document.close();
            System.out.println("PDF created successfully.");
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
