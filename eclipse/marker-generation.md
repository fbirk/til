# Marker Generation

In the eclipse IDE a custom marker can be generated via the *IMarker* API from a [resource](document-resource.md) as follows:

> IMPORTANT! Markers have to be created in the UI thread!

```java
    var marker = resource.createMarker("myCustomMarker");
    // set an ID to identify the marker (not unique if several markers of the same Misconception-Type are present!)
    marker.setAttribute(IMarker.SOURCE_ID, "myCustomMarker-" + UUID.randomUUID()); 
    marker.setAttribute(IMarker.MESSAGE, "this is an error");
    marker.setAttribute(IMarker.LINE_NUMBER, 1);
    marker.setAttribute(IMarker.SEVERITY, IMarker.SEVERITY_ERROR); // has to be the same as in the plugin.xml extension point

    // char_start is 0 relative (starts at zero), therefore subtract 1
    marker.setAttribute(IMarker.CHAR_START, start - 1);
    marker.setAttribute(IMarker.CHAR_END, end);
```

In order to use the marker, it has to be present in the plugin.xml:

```xml
   <!-- Defines a new marker type, has to be referenced by its unique id -->
   <extension
         id="myCustomMarker"
         name="Custom Marker"
         point="org.eclipse.core.resources.markers">
      <persistent value="true">
      </persistent>
      <super type="org.eclipse.core.resources.problemmarker"/>
      <super type="org.eclipse.core.resources.textmarker"/>
   </extension>
   
   <!-- Defines annotation properties: these are needed to link the styling with the actual marker -->
   <!-- !IMPORTANT! The marker severity has to be equal with the severity set in the marker attributes in code -->
   <extension point="org.eclipse.ui.editors.annotationTypes">
     <type
        super="org.eclipse.ui.workbench.texteditor.warning"
        markerType="de.example.misconceptionmarker"
        name="de.example.misconceptionannotation"
        markerSeverity="2"/>
  </extension>

  <!-- Defines styling properties of the misconception markers -->
  <!-- Especially the icon shown on the left side of the editor and the color and style of the underlines -->
  <extension point="org.eclipse.ui.editors.markerAnnotationSpecification">
     <specification
           annotationType="de.example.misconceptionannotation"
           colorPreferenceKey="de.hsrm.sls.subato.eclipse.mdf.colorPref"
           colorPreferenceValue="9, 186, 195"
           highlightPreferenceKey="squiggles.background"
           highlightPreferenceValue="false"
           icon="icons/my_custom_icon_8x8.png"
           includeOnPreferencePage="false"
           label="Misconception Info"
           overviewRulerPreferenceKey="squiggles.rulers.overview"
           overviewRulerPreferenceValue="true"
           presentationLayer="4"
           quickFixIcon="icons/my_custom_icon_8x8.png"
           textPreferenceKey="squiggles.text"
           textPreferenceValue="true"
           textStylePreferenceKey="squiggles.text.style"
           textStylePreferenceValue="SQUIGGLES"
           verticalRulerPreferenceKey="myMarkerIndicationInVerticalRuler"
           verticalRulerPreferenceValue="true"/>
  </extension>
```

-------------------------------------------
*[back to the main page](../readme.md)*
