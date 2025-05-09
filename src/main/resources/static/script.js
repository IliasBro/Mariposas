function checkFiles(files) {
    const preview = document.getElementById("preview");
    const answer = document.getElementById("answer");
    const resultCard = document.getElementById("resultCard");
    const exampleImages = document.getElementById("exampleImages");
    const exampleImageWrapper = document.getElementById("exampleImageWrapper");

    if (!files || files.length !== 1) {
        alert("Bitte genau eine Datei hochladen.");
        return;
    }

    const file = files[0];
    const fileSize = file.size / 1024 / 1024;
    if (fileSize > 10) {
        alert("Datei zu gross (max. 10Mb)");
        return;
    }

    // Preview anzeigen
    preview.src = URL.createObjectURL(file);
    preview.style.display = "block";

    // Upload vorbereiten
    const formData = new FormData();
    formData.append("image", file);

    // Request an Server
    fetch('/analyze', {
        method: 'POST',
        body: formData
    })
    .then(response => response.json())
    .then(data => {
        let resultHTML = "<ul class='list-group'>";
        exampleImages.innerHTML = ""; // Reset vorherige Bilder

        data.forEach(item => {
            const percent = (item.probability * 100).toFixed(2);
            resultHTML += `<li class='list-group-item d-flex justify-content-between align-items-center'>
                <span>${item.className}</span>
                <span class="badge bg-primary rounded-pill">${percent} %</span>
            </li>`;

            const imageDiv = document.createElement("div");
            imageDiv.className = "text-center";
            imageDiv.style.width = "180px";
            imageDiv.innerHTML = `
                <img src="/images/${item.className}.jpg" alt="${item.className}" class="img-thumbnail" style="max-width: 100%; border-radius: 0.5rem;">
                <small class="d-block mt-1">${item.className}</small>
            `;
            exampleImages.appendChild(imageDiv);
        });

        resultHTML += "</ul>";
        answer.innerHTML = resultHTML;
        resultCard.style.display = "block";
        exampleImageWrapper.style.display = "block";
    })
    .catch(error => {
        answer.textContent = "Fehler: " + error;
        resultCard.style.display = "block";
        exampleImageWrapper.style.display = "none";
    });
}
