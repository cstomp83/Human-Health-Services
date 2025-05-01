function loadMedicalRecords(username) {
    fetch(`/get_medical_records/${username}`)
        .then(response => response.text())
        .then(data => {
            document.getElementById('modalContent').innerHTML = data;
            document.getElementById('medicalRecordsModal').style.display = 'block';
        });
}

function closeModal() {
    document.getElementById('medicalRecordsModal').style.display = 'none';
}
