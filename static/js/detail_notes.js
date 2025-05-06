function loadUserDetailNotes(username) {
    fetch(`/api/user_detail_notes/${username}`)
        .then(response => response.text())
        .then(data => {
            document.getElementById("notesContent").innerHTML = data;
        })
        .catch(err => {
            document.getElementById("notesContent").innerHTML = "Error loading notes.";
            console.error("Error fetching notes:", err);
        });
}
