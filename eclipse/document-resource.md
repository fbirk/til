# Marker Generation

Get the resource of the currently active document.

> IMPORTANT! Markers have to be created in the UI thread!

```java
 /**
  * Get the current active file in the active editor (the file which is currently edited).
  * 
  * @return an IFile
  */
 private IFile getCurrentResourceInWorkspace() {
  var window = _workbench.getActiveWorkbenchWindow();
  var page = window.getActivePage();
  var editor = page.getActiveEditor().getEditorInput();
  var resource = editor.getAdapter(IFile.class);
  return resource;
 }
```

```java
private IDocument getDocumentOfResource(IFile resource) {
  var textFileBufferManager = FileBuffers.getTextFileBufferManager();
  ITextFileBuffer textFileBuffer = null;
  IDocument document = null;

  try {
   textFileBufferManager.connect(resource.getFullPath(), LocationKind.IFILE, new NullProgressMonitor());
   textFileBuffer = textFileBufferManager.getTextFileBuffer(resource.getFullPath(), LocationKind.IFILE);
   document = textFileBuffer.getDocument();

   textFileBufferManager.disconnect(resource.getFullPath(), LocationKind.IFILE, new NullProgressMonitor());
  } catch (Exception e) {
   System.err.println(e.getMessage());
   System.err.println(e.getStackTrace());
  }

  return document;
 }
```

-------------------------------------------
*[back to the main page](../readme.md)*
