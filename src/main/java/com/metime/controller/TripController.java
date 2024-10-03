package com.metime.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.metime.dao.TripDetails;
import com.metime.dao.Trips;
import com.metime.service.PDFService;
import com.metime.service.TripService;

@Controller
@RequestMapping("/MeTime/")
@CrossOrigin(origins = "http://localhost:8080")
public class TripController {

	@Autowired
	TripService tripServ;

	@Autowired
	PDFService pdfService;

	@GetMapping("home1")
	public String getHomePage() {
		return "home1";
	}

//	@PostMapping("saveTrips")
//	public Trips saveTrips(@RequestBody Trips trips) {
//		
//		tripServ.saveTrips(trips);
//		return trips;
//	}

//	@GetMapping("getTrips")
//	public List<Trips> getAllTrips(){
//		return tripServ.getTrips();
//	}

	@GetMapping("addForm")
	public String addForm() {
		return "addNewTrip";
	}

//	@PostMapping("addtrip")
//	public String saveTrips(@ModelAttribute Trips trips) {
//		
//		tripServ.saveTrips(trips);
//		return "redirect:/MeTime/getTrips";
//	}

	@PostMapping("addtrip")
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<String> saveTrips(@RequestParam("trId") String tripId, @RequestParam String OD,
	        @RequestParam String journeyDate, @RequestParam String tripDuration, @RequestParam String tripCategory,
	        @RequestParam int tripCharges, @RequestParam("imgpth") String imagePath, @RequestParam("desc") String desc) {

	    // Logging Authorities
	    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    System.out.println("Add Authorities: " + auth.getAuthorities());

	    // Date parsing logic
	    SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
	    Date startDate = null;
	    Date endDate = null;

	    // Parse the date range
	    String[] dates = journeyDate.split(" - ");
	    try {
	        startDate = dateFormat.parse(dates[0]);
	        endDate = dateFormat.parse(dates[1]);
	    } catch (ParseException e) {
	        e.printStackTrace();
	    }

	    // Creating and setting the Trips entity
	    Trips trips = new Trips();
	    trips.setTripId(tripId);
	    trips.setOD(OD);
	    trips.setStartDate(startDate);
	    trips.setEndDate(endDate);
	    trips.setDuration(tripDuration);
	    trips.setCategory(tripCategory);
	    trips.setCharges(tripCharges);

	    // Check if tripId is duplicate
	    if (tripServ.isTripIdDuplicate(tripId)) {
	        return ResponseEntity.status(HttpStatus.CONFLICT).body("Duplicate tripId");
	    }

	    // Save Trips entity
	    tripServ.saveTrips(trips);

	    // Creating and setting the TripDetails entity
	    TripDetails trDtls = new TripDetails();
	    trDtls.setDesc(desc);
	    trDtls.setImagePath(imagePath);
	    trDtls.setTrip(trips);  // Associate TripDetails with Trips entity
	    System.out.println("Trip Details======" + trDtls);

	    // Save TripDetails entity
	    tripServ.saveTripDetails(trDtls);

	    return ResponseEntity.ok("Trip Added Successfully!!");
	}

	@GetMapping("getTrips/{keyword}")
	public ResponseEntity<List<Trips>> searchByCategoryOrOD(@PathVariable("keyword") String keyword) {
		try {
			List<Trips> trips = tripServ.searchByCategoryOrOD(keyword);
			if (trips.isEmpty()) {
				return new ResponseEntity<>(HttpStatus.NO_CONTENT);
			}
			return new ResponseEntity<>(trips, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}

	}
	
	/*
	 * @PostMapping("/search") public String
	 * searchByCategoryOrOD(@RequestParam("keyword") String keyword, Model model) {
	 * List<Trips> trips = tripServ.searchByCategoryOrOD(keyword);
	 * model.addAttribute("listOfTrips", trips); model.addAttribute("keyword",
	 * keyword); return "home"; // Assuming your JSP file is named home.jsp }
	 */

	/*
	 * @PostMapping("/search")
	 * 
	 * @ResponseBody public List<Trips>
	 * searchByCategoryOrOD(@RequestParam("keyword") String keyword) { return
	 * tripServ.searchByCategoryOrOD(keyword); }
	 */

	@DeleteMapping("deleteTrips/{id}")
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<String> deleteTrip(@PathVariable("id") String tripId) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		System.out.println("Delete Authorities: " + auth.getAuthorities());

		tripServ.deletetrip(tripId);
		return ResponseEntity.ok("Trip Deleted");
	}

	/*
	 * @PostMapping("updatetrip/{id}") public String updateTrips(@PathVariable("id")
	 * String tripId, @RequestParam String OD, @RequestParam("tripcategory") String
	 * category, @RequestParam("tripcharges") int charges) {
	 * tripServ.updateTrip(tripId, OD, category, charges);
	 * 
	 * System.out.println(charges); System.out.println(OD);
	 * System.out.println(category); return "redirect:/MeTime/getTrips"; }
	 */

	@PutMapping("updatetrip/{id}")
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<String> updateTrips(@PathVariable("id") String tripId, @RequestParam String OD,
			@RequestParam("tripcategory") String category, @RequestParam("tripcharges") int charges) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		System.out.println("Update Authorities: " + auth.getAuthorities());

		try {
			tripServ.updateTrip(tripId, OD, category, charges);
			return ResponseEntity.ok("Data Updated Successfully");
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error Updating Data");
		}
	}

	@GetMapping("aboutUS")
	public String aboutPage() {
		return "aboutUS";
	}

	@GetMapping("/downloaditinerary")
	public ResponseEntity<byte[]> pdfDownload(@RequestParam("filename") String fileName, @RequestParam("id") String id)
			throws IOException {
		pdfService.pdfCreation(id);

		String directoryPath = "D:\\PDFs\\";
		File fileDownload = new File(directoryPath + fileName);

		if (fileDownload.exists() && !fileDownload.isDirectory()) {
			byte[] getFileData = FileUtils.readFileToByteArray(fileDownload);

			return ResponseEntity.ok().header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=" + fileName)
					.contentType(MediaType.APPLICATION_PDF).body(getFileData);
		} else {
			System.out.println("File Not Found!!");
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
		}
	}

//	
//	@PostMapping("updateTrip")
//	public String updateTrips() {
//		return "updateTrip";
//	}
}
