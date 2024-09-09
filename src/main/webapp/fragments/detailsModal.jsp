
<!-- Details Modal -->
<div class="modal fade" id="detailsModal" tabindex="-1" role="dialog" aria-labelledby="detailsModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="detailsModalLabel">Amazing Trip Details</h5>
                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" id="detailsContent">
            <input type="hidden" id="hiddenTripId" value="">
                <p>This is an amazing trip with a well-planned itinerary that will take you through the most beautiful places. The journey includes a stay in luxurious accommodations, guided tours, and exciting activities that cater to all interests. Experience the best of nature, culture, and adventure, and create lasting memories with this trip. Explore scenic landscapes, historical landmarks, and local cuisine, all while enjoying the comfort and convenience of a well-organized travel plan. This trip is perfect for those looking for a blend of relaxation and exploration, offering something special for every traveler.</p>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus lacinia odio vitae vestibulum. Aenean ut orci vitae nunc fringilla pharetra. Duis gravida nunc ac fringilla pretium. Proin cursus auctor justo, non tincidunt ante laoreet a. Suspendisse potenti. Nam tempor, lectus sed consectetur varius, nisi augue tincidunt nulla, a pellentesque arcu dolor a lacus. Curabitur sed velit ut justo varius tincidunt. Integer ac risus et ex cursus auctor.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="downloadPDF()">Download Itinerary</button>
            	<button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

