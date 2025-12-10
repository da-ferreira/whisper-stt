from fastapi import FastAPI, UploadFile, File
import whisper
import uvicorn
import os

app = FastAPI()

model = whisper.load_model("turbo")  # tiny, base, small, medium, large or turbo


@app.post("/stt")
async def transcribe(audio: UploadFile = File(...)):
    temp_file = f"temp_{audio.filename}"

    with open(temp_file, "wb") as f:
        f.write(await audio.read())

    result = model.transcribe(
        temp_file, language="en", word_timestamps=True, task="transcribe"
    )

    os.remove(temp_file)

    return result


if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8880)
