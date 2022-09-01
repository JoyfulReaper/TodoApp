using Todo.Library.Models;

namespace Todo.Library.Repositories;

public class ToDoListRepo
{
	private readonly IDataAccess _dataAccess;

	public ToDoListRepo(IDataAccess dataAccess)
	{
		_dataAccess = dataAccess;
	}

	public async Task SaveAsync(ToDoList todoList)
	{
		int id = await _dataAccess.SaveDataAndGetIdAsync("spTodoList_Upsert", new
		{
			todoList.ToDoListId,
			todoList.UserId,
			todoList.Name,
			todoList.DateDeleted
		}, "Data");
		todoList.ToDoListId = id;
	}

	public async Task<ToDoList?> GetAsync(int toDoListId)
	{
		return (await _dataAccess.LoadDataAsync<ToDoList, dynamic>("spTodoList_Get", new { toDoListId }, "Data"))
			.SingleOrDefault();
	}
}
