
​      
  <div id="readme" class="Box-body readme blob js-code-block-container px-5">
    <article class="markdown-body entry-content" itemprop="text"><p><a href="https://a1ive.github.io/grub2-filemanager/" rel="nofollow">简体中文</a></p>
<h1><a id="user-content-grub2-filemanager-网启版" class="anchor" aria-hidden="true" href="#grub2-filemanager-网启版"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>grub2-filemanager 网启版</h1>
<ol>
<li>
<p>uefi                 网启文件为 loadfmx64.efi.0</p>
</li>
<li>
<p>Legacy BIOS  网启文件为 pxefm.0</p>
</li>
<li>
<p>可以不用借助dir.txt(和grub4dos的dir.txt通用)直接列表并生成菜单项！tinypxe直接支持，其它web服务器根目录下不能存在index.html且支持目录浏览，无法退回网启菜单请按F5!</p>
</li>
<li>
<p>EFI和Legacy BIOS均支持直接启动网络上的wim、 iso类型的pe</p>
</li>
<li>
<p>grubfmx64.efi支持本地、网络两用，本地使用也可以按f4开启网络并按f5调出网启菜单</p>
</li>
</ol>
<h6><a id="user-content-legacy-bios" class="anchor" aria-hidden="true" href="#legacy-bios"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>Legacy bios</h6>
<pre><code>          wim  wimboot
          img  memdisk
          iso  memdisk+sanboot(ipxe)+grub4dos
          vhd  grub4dos
</code></pre>
<h6><a id="user-content-x86_64-efi" class="anchor" aria-hidden="true" href="#x86_64-efi"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>x86_64-efi</h6>
<pre><code>          wim  wimboot
          img  map --mem
          iso  map --mem
</code></pre>
<h2><a id="user-content-download" class="anchor" aria-hidden="true" href="#download"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>Download</h2>
<p><a href="https://github.com/zwj4031/netgrubfm/releases">https://github.com/zwj4031/netgrubfm/releases</a></p>
     以下为衍生作品，网络安装微软原版系统，只需要准备一个iso即可，不用准备boot.wim和pe
     https://github.com/zwj4031/netinstall
<h6><a id="user-content----" class="anchor" aria-hidden="true" href="#---"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a><a target="_blank" rel="noopener noreferrer" href="https://camo.githubusercontent.com/f30eb73cd4a195cbefc041dfeb7bd9691b0b54ff/68747470733a2f2f696d672e736869656c64732e696f2f6769746875622f6c6963656e73652f61316976652f67727562322d66696c656d616e616765722e7376673f7374796c653d666c6174"><img src="https://camo.githubusercontent.com/f30eb73cd4a195cbefc041dfeb7bd9691b0b54ff/68747470733a2f2f696d672e736869656c64732e696f2f6769746875622f6c6963656e73652f61316976652f67727562322d66696c656d616e616765722e7376673f7374796c653d666c6174" alt="" data-canonical-src="https://img.shields.io/github/license/a1ive/grub2-filemanager.svg?style=flat" style="max-width:100%;"></a> <a target="_blank" rel="noopener noreferrer" href="https://camo.githubusercontent.com/bc2790e365348dbb402414106244aa3bca2e8464/68747470733a2f2f696d672e736869656c64732e696f2f6769746875622f646f776e6c6f6164732f61316976652f67727562322d66696c656d616e616765722f746f74616c2e7376673f7374796c653d666c6174"><img src="https://camo.githubusercontent.com/bc2790e365348dbb402414106244aa3bca2e8464/68747470733a2f2f696d672e736869656c64732e696f2f6769746875622f646f776e6c6f6164732f61316976652f67727562322d66696c656d616e616765722f746f74616c2e7376673f7374796c653d666c6174" alt="" data-canonical-src="https://img.shields.io/github/downloads/a1ive/grub2-filemanager/total.svg?style=flat" style="max-width:100%;"></a> <a target="_blank" rel="noopener noreferrer" href="https://camo.githubusercontent.com/98521f1b2bb629c9ec054af023a254cb0e621c4a/68747470733a2f2f696d672e736869656c64732e696f2f6769746875622f72656c656173652f61316976652f67727562322d66696c656d616e616765722e7376673f7374796c653d666c6174"><img src="https://camo.githubusercontent.com/98521f1b2bb629c9ec054af023a254cb0e621c4a/68747470733a2f2f696d672e736869656c64732e696f2f6769746875622f72656c656173652f61316976652f67727562322d66696c656d616e616765722e7376673f7374796c653d666c6174" alt="" data-canonical-src="https://img.shields.io/github/release/a1ive/grub2-filemanager.svg?style=flat" style="max-width:100%;"></a> <a href="https://crowdin.com/project/grub2-filemanager" rel="nofollow"><img src="https://camo.githubusercontent.com/c67787d6393436eb17afc95607059de81c381c51/68747470733a2f2f6261646765732e63726f7764696e2e6e65742f67727562322d66696c656d616e616765722f6c6f63616c697a65642e737667" alt="Crowdin" data-canonical-src="https://badges.crowdin.net/grub2-filemanager/localized.svg" style="max-width:100%;"></a></h6>
<h2><a id="user-content-preview-以下为本地版功能" class="anchor" aria-hidden="true" href="#preview-以下为本地版功能"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>Preview [以下为本地版功能]</h2>
<p><a target="_blank" rel="noopener noreferrer" href="https://github.com/a1ive/grub2-filemanager/raw/gh-pages/preview.png"><img src="https://github.com/a1ive/grub2-filemanager/raw/gh-pages/preview.png" alt="preview.png" style="max-width:100%;"></a></p>
<table>
<thead>
<tr>
<th align="left">Type</th>
<th align="center">i386-pc</th>
<th align="center">i386-efi</th>
<th align="center">x86_64-efi</th>
</tr>
</thead>
<tbody>
<tr>
<td align="left"><a target="_blank" rel="noopener noreferrer" href="https://github.com/a1ive/grub2-filemanager/raw/gh-pages/images/iso.png"><img src="https://github.com/a1ive/grub2-filemanager/raw/gh-pages/images/iso.png" alt="img" style="max-width:100%;"></a>WinPE ISO</td>
<td align="center"><g-emoji class="g-emoji" alias="heavy_check_mark" fallback-src="https://github.githubassets.com/images/icons/emoji/unicode/2714.png">✔️</g-emoji></td>
<td align="center"><g-emoji class="g-emoji" alias="heavy_check_mark" fallback-src="https://github.githubassets.com/images/icons/emoji/unicode/2714.png">✔️</g-emoji></td>
<td align="center"><g-emoji class="g-emoji" alias="heavy_check_mark" fallback-src="https://github.githubassets.com/images/icons/emoji/unicode/2714.png">✔️</g-emoji></td>
</tr>
<tr>
<td align="left"><a target="_blank" rel="noopener noreferrer" href="https://github.com/a1ive/grub2-filemanager/raw/gh-pages/images/linux.png"><img src="https://github.com/a1ive/grub2-filemanager/raw/gh-pages/images/linux.png" alt="img" style="max-width:100%;"></a>Linux ISO</td>
<td align="center"><g-emoji class="g-emoji" alias="heavy_check_mark" fallback-src="https://github.githubassets.com/images/icons/emoji/unicode/2714.png">✔️</g-emoji></td>
<td align="center"><g-emoji class="g-emoji" alias="heavy_check_mark" fallback-src="https://github.githubassets.com/images/icons/emoji/unicode/2714.png">✔️</g-emoji></td>
<td align="center"><g-emoji class="g-emoji" alias="heavy_check_mark" fallback-src="https://github.githubassets.com/images/icons/emoji/unicode/2714.png">✔️</g-emoji></td>
</tr>
<tr>
<td align="left"><a target="_blank" rel="noopener noreferrer" href="https://github.com/a1ive/grub2-filemanager/raw/gh-pages/images/android.png"><img src="https://github.com/a1ive/grub2-filemanager/raw/gh-pages/images/android.png" alt="img" style="max-width:100%;"></a>Android ISO</td>
<td align="center"><g-emoji class="g-emoji" alias="heavy_check_mark" fallback-src="https://github.githubassets.com/images/icons/emoji/unicode/2714.png">✔️</g-emoji></td>
<td align="center"><g-emoji class="g-emoji" alias="heavy_check_mark" fallback-src="https://github.githubassets.com/images/icons/emoji/unicode/2714.png">✔️</g-emoji></td>
<td align="center"><g-emoji class="g-emoji" alias="heavy_check_mark" fallback-src="https://github.githubassets.com/images/icons/emoji/unicode/2714.png">✔️</g-emoji></td>
</tr>
<tr>
<td align="left"><a target="_blank" rel="noopener noreferrer" href="https://github.com/a1ive/grub2-filemanager/raw/gh-pages/images/bsd.png"><img src="https://github.com/a1ive/grub2-filemanager/raw/gh-pages/images/bsd.png" alt="img" style="max-width:100%;"></a>BSD ISO</td>
<td align="center"><g-emoji class="g-emoji" alias="heavy_check_mark" fallback-src="https://github.githubassets.com/images/icons/emoji/unicode/2714.png">✔️</g-emoji></td>
<td align="center"><g-emoji class="g-emoji" alias="x" fallback-src="https://github.githubassets.com/images/icons/emoji/unicode/274c.png">❌</g-emoji></td>
<td align="center"><g-emoji class="g-emoji" alias="x" fallback-src="https://github.githubassets.com/images/icons/emoji/unicode/274c.png">❌</g-emoji></td>
</tr>
<tr>
<td align="left"><a target="_blank" rel="noopener noreferrer" href="https://github.com/a1ive/grub2-filemanager/raw/gh-pages/images/img.png"><img src="https://github.com/a1ive/grub2-filemanager/raw/gh-pages/images/img.png" alt="img" style="max-width:100%;"></a>IMG (Disk Image)</td>
<td align="center"><g-emoji class="g-emoji" alias="heavy_check_mark" fallback-src="https://github.githubassets.com/images/icons/emoji/unicode/2714.png">✔️</g-emoji></td>
<td align="center"><g-emoji class="g-emoji" alias="heavy_check_mark" fallback-src="https://github.githubassets.com/images/icons/emoji/unicode/2714.png">✔️</g-emoji></td>
<td align="center"><g-emoji class="g-emoji" alias="heavy_check_mark" fallback-src="https://github.githubassets.com/images/icons/emoji/unicode/2714.png">✔️</g-emoji></td>
</tr>
<tr>
<td align="left"><a target="_blank" rel="noopener noreferrer" href="https://github.com/a1ive/grub2-filemanager/raw/gh-pages/images/vhd.png"><img src="https://github.com/a1ive/grub2-filemanager/raw/gh-pages/images/vhd.png" alt="img" style="max-width:100%;"></a>VHD</td>
<td align="center"><g-emoji class="g-emoji" alias="heavy_check_mark" fallback-src="https://github.githubassets.com/images/icons/emoji/unicode/2714.png">✔️</g-emoji></td>
<td align="center"><g-emoji class="g-emoji" alias="heavy_check_mark" fallback-src="https://github.githubassets.com/images/icons/emoji/unicode/2714.png">✔️</g-emoji></td>
<td align="center"><g-emoji class="g-emoji" alias="heavy_check_mark" fallback-src="https://github.githubassets.com/images/icons/emoji/unicode/2714.png">✔️</g-emoji></td>
</tr>
<tr>
<td align="left"><a target="_blank" rel="noopener noreferrer" href="https://github.com/a1ive/grub2-filemanager/raw/gh-pages/images/nt6.png"><img src="https://github.com/a1ive/grub2-filemanager/raw/gh-pages/images/nt6.png" alt="img" style="max-width:100%;"></a>WinPE WIM</td>
<td align="center"><g-emoji class="g-emoji" alias="heavy_check_mark" fallback-src="https://github.githubassets.com/images/icons/emoji/unicode/2714.png">✔️</g-emoji></td>
<td align="center"><g-emoji class="g-emoji" alias="heavy_check_mark" fallback-src="https://github.githubassets.com/images/icons/emoji/unicode/2714.png">✔️</g-emoji></td>
<td align="center"><g-emoji class="g-emoji" alias="heavy_check_mark" fallback-src="https://github.githubassets.com/images/icons/emoji/unicode/2714.png">✔️</g-emoji></td>
</tr>
<tr>
<td align="left"><a target="_blank" rel="noopener noreferrer" href="https://github.com/a1ive/grub2-filemanager/raw/gh-pages/images/nt5.png"><img src="https://github.com/a1ive/grub2-filemanager/raw/gh-pages/images/nt5.png" alt="img" style="max-width:100%;"></a>NT5 WinPE</td>
<td align="center"><g-emoji class="g-emoji" alias="heavy_check_mark" fallback-src="https://github.githubassets.com/images/icons/emoji/unicode/2714.png">✔️</g-emoji></td>
<td align="center"><g-emoji class="g-emoji" alias="x" fallback-src="https://github.githubassets.com/images/icons/emoji/unicode/274c.png">❌</g-emoji></td>
<td align="center"><g-emoji class="g-emoji" alias="x" fallback-src="https://github.githubassets.com/images/icons/emoji/unicode/274c.png">❌</g-emoji></td>
</tr>
<tr>
<td align="left"><a target="_blank" rel="noopener noreferrer" href="https://github.com/a1ive/grub2-filemanager/raw/gh-pages/images/kernel.png"><img src="https://github.com/a1ive/grub2-filemanager/raw/gh-pages/images/kernel.png" alt="img" style="max-width:100%;"></a>Linux/Multiboot Kernel</td>
<td align="center"><g-emoji class="g-emoji" alias="heavy_check_mark" fallback-src="https://github.githubassets.com/images/icons/emoji/unicode/2714.png">✔️</g-emoji></td>
<td align="center"><g-emoji class="g-emoji" alias="heavy_check_mark" fallback-src="https://github.githubassets.com/images/icons/emoji/unicode/2714.png">✔️</g-emoji></td>
<td align="center"><g-emoji class="g-emoji" alias="heavy_check_mark" fallback-src="https://github.githubassets.com/images/icons/emoji/unicode/2714.png">✔️</g-emoji></td>
</tr>
<tr>
<td align="left"><a target="_blank" rel="noopener noreferrer" href="https://github.com/a1ive/grub2-filemanager/raw/gh-pages/images/efi.png"><img src="https://github.com/a1ive/grub2-filemanager/raw/gh-pages/images/efi.png" alt="img" style="max-width:100%;"></a>EFI Application</td>
<td align="center"><g-emoji class="g-emoji" alias="x" fallback-src="https://github.githubassets.com/images/icons/emoji/unicode/274c.png">❌</g-emoji></td>
<td align="center"><g-emoji class="g-emoji" alias="heavy_check_mark" fallback-src="https://github.githubassets.com/images/icons/emoji/unicode/2714.png">✔️</g-emoji></td>
<td align="center"><g-emoji class="g-emoji" alias="heavy_check_mark" fallback-src="https://github.githubassets.com/images/icons/emoji/unicode/2714.png">✔️</g-emoji></td>
</tr>
</tbody>
</table>
<h2><a id="user-content-download-1" class="anchor" aria-hidden="true" href="#download-1"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>Download</h2>
<p><a href="https://github.com/a1ive/grub2-filemanager/releases">https://github.com/a1ive/grub2-filemanager/releases</a></p>
<h2><a id="user-content-build" class="anchor" aria-hidden="true" href="#build"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>Build</h2>
<pre><code>git clone https://github.com/a1ive/grub2-filemanager.git
cd grub2-filemanager
./update_grub2.sh
./build.sh
</code></pre>
<h2><a id="user-content-boot" class="anchor" aria-hidden="true" href="#boot"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>Boot</h2>
<h3><a id="user-content-i386-pc" class="anchor" aria-hidden="true" href="#i386-pc"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>i386-pc</h3>
<p>DO NOT boot grubfm.iso with memdisk!</p>
<h4><a id="user-content-grub4dos" class="anchor" aria-hidden="true" href="#grub4dos"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>GRUB4DOS</h4>
<pre><code>map --mem /grubfm.iso (0xff)
map --hook
chainloader (0xff)
</code></pre>
<h4><a id="user-content-grub-2" class="anchor" aria-hidden="true" href="#grub-2"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>GRUB 2</h4>
<pre><code>linux /loadfm  
initrd /grubfm.iso  
</code></pre>
<h3><a id="user-content-x86_64-efi-1" class="anchor" aria-hidden="true" href="#x86_64-efi-1"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>x86_64-efi</h3>
<h4><a id="user-content-grub-2-1" class="anchor" aria-hidden="true" href="#grub-2-1"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>GRUB 2</h4>
<pre><code>chainloader /grubfmx64.efi
</code></pre>
<h4><a id="user-content-refind" class="anchor" aria-hidden="true" href="#refind"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>rEFInd</h4>
<pre><code>loader /grubfmx64.efi
</code></pre>
<h4><a id="user-content-systemd-boot" class="anchor" aria-hidden="true" href="#systemd-boot"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>Systemd-boot</h4>
<pre><code>efi /grubfmx64.efi
</code></pre>
<h2><a id="user-content-source-code" class="anchor" aria-hidden="true" href="#source-code"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>Source code</h2>
<p>GRUB2: <a href="https://github.com/a1ive/grub">https://github.com/a1ive/grub</a></p>
<h2><a id="user-content-help-to-translate" class="anchor" aria-hidden="true" href="#help-to-translate"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>Help to translate</h2>
<p><a href="https://crowdin.com/project/grub2-filemanager" rel="nofollow">Crowdin</a></p>
<h2><a id="user-content-similar-projects" class="anchor" aria-hidden="true" href="#similar-projects"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>Similar projects</h2>
<ul>
<li><a href="http://mbusb.aguslr.com/" rel="nofollow">Multiboot USB</a></li>
<li><a href="https://github.com/Jimmy-Z/grub-iso-boot">grub-iso-boot</a></li>
<li><a href="https://github.com/mpolitzer/grub-iso-multiboot">grub-iso-multiboot</a></li>
<li><a href="https://github.com/thias/glim">GLIM</a></li>
<li><a href="http://www.easy2boot.com/" rel="nofollow">Easy2Boot</a></li>
<li><a href="http://bbs.wuyou.net/forum.php?mod=viewthread&amp;tid=320715" rel="nofollow">GRUB2 File Explorer</a></li>
<li><a href="http://bbs.wuyou.net/forum.php?mod=viewthread&amp;tid=191301" rel="nofollow">RUN</a></li>
<li><a href="http://bbs.wuyou.net/forum.php?mod=viewthread&amp;tid=203607" rel="nofollow">G4D AUTOMENU</a></li>
</ul>
<h1><a id="user-content-netgrubfm" class="anchor" aria-hidden="true" href="#netgrubfm"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>netgrubfm</h1>
</article>
  </div>

  




