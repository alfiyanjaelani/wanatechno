<!DOCTYPE html>
<html>
<head>
	<title>Menghubungkan codeigniter dengan database mysql</title>
</head>
<body>
	<h1>Mengenal Model Pada Codeigniter | MalasNgoding.com</h1>
	<table border="1">
		<tr>
			<th>Nama</th>
			<th>Password</th>
			<th>Status</th>
		</tr>
		<?php foreach($mst_petugas as $u){ ?>
		<tr>
			<td><?php echo $u->nama_ptgs ?></td>
			<td><?php echo $u->password_ptgs ?></td>
			<td><?php echo $u->status_ptgs ?></td>
		</tr>
		<?php } ?>
	</table>
</body>
</html>