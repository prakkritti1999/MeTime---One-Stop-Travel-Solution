<!-- 	Update Records Modal-->
<div class="modal fade" id="updateModal" tabindex="-1" role="dialog"
	aria-labelledby="updateModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="updateModalLabel">---- Update
					Trips As Required ----</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form id="updateForm">
					<div class="form-group mb-3">
						<label for="updateId">ID</label> <input type="text"
							class="form-control" id="updateId" name="updateId" required
							disabled>
					</div>
					<div class="form-group mb-3">
						<label for="updateOD">Source - Destination</label> <input
							type="text" class="form-control" id="updateOD" name="updateOD"
							required>
					</div>

					<div class="form-group mb-3">
						<label for="journeyDate" class="form-label" for="journeyDate">Journey
							Date</label> <input type="text" class="form-control" id="journeyDate"
							name="journeyDate" placeholder="Enter date of journey"
							disabled="disabled">
					</div>

					<div class="form-group mb-3">
						<label for="updateDuration">Duration</label> <input type="text"
							class="form-control" id="updateDuration" name="updateDuration"
							disabled="disabled">
					</div>
					<div class="form-group mb-3">
						<label for="updateCategory">Category</label> <input type="text"
							class="form-control" id="updateCategory" name="updateCategory"
							required>
					</div>
					<div class="form-group mb-3">
						<label for="updateCharges">Charges</label> <input type="text"
							class="form-control" id="updateCharges" name="updateCharges"
							required>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary"
					onclick="updateTripsData();">Save changes</button>
			</div>
		</div>
	</div>
</div>