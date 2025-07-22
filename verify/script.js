async function verifyHash() {
  const hash = document.getElementById("hashInput").value.trim();
  if (!hash) return alert("Please enter a hash ID.");

  //const res = await fetch("http://localhost:3000/api/verify", {
  const res = await fetch("https://zev-focus-backend.vercel.app/api/verify", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ hash }),
  });

  const data = await res.json();
  const resultBox = document.getElementById("result");

  if (!data.valid) {
    resultBox.innerHTML = `❌ Invalid hash – ${data.error || "verification failed"}`;
    return;
  }

  const { user, date, time, session, streak } = data;
  resultBox.innerHTML = `
    ✅ Hash verified<br/>
    <strong>User:</strong> ${user}<br/>
    <strong>Date:</strong> ${date}<br/>
    <strong>Focus Time:</strong> ${time} sec<br/>
    <strong>Streak:</strong> ${streak}
    <strong>Total Sessions:</strong> ${session}
  `;
}

