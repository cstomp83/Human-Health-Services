document.addEventListener('DOMContentLoaded', () => {
  const container = document.getElementById("security-questions-container");

  for (let i = 1; i <= 3; i++) {
    const label = document.createElement("label");
    label.setAttribute("for", `security-question-${i}`);
    label.textContent = `Choose a security question ${i}`;

    const select = document.createElement("select");
    select.setAttribute("id", `security-question-${i}`);
    select.setAttribute("name", `security-question-${i}`);
    select.required = true;

    const questions = [
      "What is your mother's maiden name?",
      "What was the name of your first pet?",
      "What was the name of your elementary school?",
      "What is your favorite color?"
    ];

    questions.forEach(question => {
      const option = document.createElement("option");
      option.value = question;
      option.textContent = question;
      select.appendChild(option);
    });

    const answerInput = document.createElement("input");
    answerInput.setAttribute("type", "text");
    answerInput.setAttribute("name", `security-answer-${i}`);
    answerInput.setAttribute("placeholder", "Your answer");
    answerInput.required = true;

    container.appendChild(label);
    container.appendChild(document.createElement("br"));
    container.appendChild(select);
    container.appendChild(document.createElement("br"));
    container.appendChild(answerInput);
    container.appendChild(document.createElement("br"));
    container.appendChild(document.createElement("br"));
  }
  
  form.addEventListener('submit', function (event) {
    event.preventDefault(); // Prevent normal form submission

    // Collect all form data
    const formData = new FormData(form);

    // Collect security question answers and add them to the formData
    for (let i = 1; i <= 3; i++) {
        const question = document.getElementById(`security-question-${i}`).value;
        const answer = document.querySelector(`[name="security-answer-${i}"]`).value;
        formData.append(`security-question-${i}`, question);
        formData.append(`security-answer-${i}`, answer);
    }

    // Send the data via fetch to Flask
    fetch(form.action, {
        method: 'POST',
        body: formData,
    })
    .then(response => response.json())
    .then(data => {
        console.log(data); // Process the response (e.g., show success/error message)
        if (data.success) {
            // Redirect or update the UI accordingly
        } else {
            // Handle errors
        }
    })
    .catch(error => console.error('Error:', error));
});
});
