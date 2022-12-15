# WPF Interaction Triggers

To react to XAML events in an MVVM manner, one can use *Interaction Triggers*.

> Since 2019 Microsoft open sourced their XAML Behaviors libraries.
> To use Interaction Triggers, remove the old references to `Microsoft.Expression.Interactions` and `System.Windows.Interactivity` and install the NuGet package `Microsoft.Xaml.Behaviors.Wpf`.

## Event Example

> The new XAML reference is: `xmlns:i="http://schemas.microsoft.com/xaml/behaviors"`

```xml
<Button Content="Do something with selected item">
   <i:Interaction.Triggers>
      <i:EventTrigger EventName="MouseDoubleClick">
         <i:InvokeCommandAction Command="{Binding DoSomethingCommand}"  />
      </i:EventTrigger>
   </i:Interaction.Triggers>
</Button>
```

With the trigger above, the `MouseDoubleClick` event can be bind to a command in the viewmodel like usual.

## Styling Example

It is also possible to use an interaction trigger to change the styling of a control accordingly.

```xml
<ComboBox Style="{StaticResource ComboBoxBranch}">
     <i:Interaction.Triggers>
          <i:EventTrigger EventName="SelectionChanged">
             <i:InvokeCommandAction Command="{Binding SelectCustomerCommand}" CommandParameter="{Binding SelectedBranch}" />
          </i:EventTrigger>
     </i:Interaction.Triggers>
</ComboBox>
```

-------------------------------------------
*[back to the main page](../../readme.md)*
