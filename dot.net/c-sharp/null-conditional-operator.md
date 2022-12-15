# The null conditional operator

In case of a nullable object with properties and further methods, it is wise to first check whether the object is initialized before referencing any properties or methods, otherwise an exception may occur. 
With the null-conditional operators it is possible to execute this null-reference check while referencing child properties and even provide an alternative if needed.

```c#
public int SumNumberOfGoals(Games games) {
    return games?.GetNumberOfGoals() ?? 0;
}

```
In the example above, when `games` is initialized, the result of the method `GetNumberOfGoals()` is returned, otherwise the expression is null. The with the null-conditional operator `??` an alternative/default result can be provided.

-------------------------------------------
*[back to the main page](../../readme.md)*
