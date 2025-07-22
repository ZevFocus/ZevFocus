// script.js
(async function () {
  const hash = new URLSearchParams(location.search).get("hash");
  const details = document.getElementById("details");

  if (!hash) {
    details.textContent = "❌ No hash found in URL.";
    return;
  }

  try {
    const res = await fetch("https://zev-focus-backend.vercel.app/api/verify", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ hash }),
    });

    const data = await res.json();

    if (!data.valid) {
      details.innerHTML = `❌ Invalid session hash. <br/><small>${data.error || "Try again later."}</small>`;
      return;
    }

    const { user, date, time, session, streak } = data;

    details.innerHTML = `
      ✅ <strong>${user}</strong> completed a ZevFocus session!<br/>
      📅 <strong>Date:</strong> ${date}<br/>
      ⏱ <strong>Time:</strong> ${time} min<br/>
      🔥 <strong>Streak:</strong> ${streak} days<br/>
      💻 <strong>Total Sessions:</strong> ${session}<br/>
      <br/>
      🚀 Try it yourself: <a href="https://zevfocus.dev" target="_blank">zevfocus.dev</a>
    `;
  } catch (err) {
    console.error("Fetch failed:", err);
    details.textContent = "⚠️ Could not load session data.";
  }
})();

