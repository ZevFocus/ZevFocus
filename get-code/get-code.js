document.getElementById("codeForm").addEventListener("submit", async (e) => {
  e.preventDefault();

  const name = document.getElementById("name").value.trim();
  const email = document.getElementById("email").value.trim();

  const response = await fetch("https://zev-focus-api.vercel.app/api/generate-code", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ name, email })
  });

  if (!response.ok) {
    alert("Error generating code. Please try again.");
    return;
  }

  const data = await response.json();
  document.getElementById("codeOutput").textContent = data.code;
  document.getElementById("result").classList.remove("hidden");
});

