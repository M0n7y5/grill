using System;
using Click;

namespace Grill.Commands;

[Command("make", "Install the neccessary dependencies and make a workspace")]
class MakeCommand
{
	[Argument("path", "Path to the workspace", "p", ".")]
	public String Path ~ delete _;

	public Result<void> Run()
	{
		Workspace workspace = scope .(Path);
		Try!(workspace.Open());

		return workspace.Make();
	}
}